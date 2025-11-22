FROM node:18-slim AS builder
WORKDIR /app
COPY app/package*.json ./
RUN npm ci
COPY app/ .

FROM node:18-slim AS production
WORKDIR /app
COPY --from=builder /app/package*.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY --from=builder /app .
RUN getent passwd appuser || useradd -m appuser && \
    chown -R appuser:appuser /app
USER appuser
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)}).on('error', () => process.exit(1))" || exit 1
CMD ["node", "index.js"]