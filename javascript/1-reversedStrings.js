/*
  https://www.codewars.com/kata/5168bb5dfe9a00b126000018/train/javascript
*/

function solution(str) {
    return str.split("").reverse().join("");
}

var assert = require('assert');

assert.strictEqual(solution('world'), 'dlrow')
assert.strictEqual(solution('hello'), 'olleh')
assert.strictEqual(solution(''), '')
assert.strictEqual(solution('h'), 'h')
