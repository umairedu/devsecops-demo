const { hello } = require('../index');

describe('Hello function', () => {
  test('returns greeting with valid name', () => {
    expect(hello('Umair')).toBe('Hello, Umair!');
  });

  test('returns greeting with different name', () => {
    expect(hello('World')).toBe('Hello, World!');
  });

  test('throws error with empty string', () => {
    expect(() => hello('')).toThrow('Name must be a non-empty string');
  });

  test('throws error with null', () => {
    expect(() => hello(null)).toThrow('Name must be a non-empty string');
  });

  test('throws error with undefined', () => {
    expect(() => hello(undefined)).toThrow('Name must be a non-empty string');
  });

  test('throws error with non-string type', () => {
    expect(() => hello(123)).toThrow('Name must be a non-empty string');
  });
});


