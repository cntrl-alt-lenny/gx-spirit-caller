/* data_02101f34 -- MD5 message-schedule index table (the "g" function),
 * one 16-entry row per compression round (64 bytes, 4x16).
 *
 * Sole consumer func_02077fd8.s (MD5 compression/transform): 4 rounds,
 * each advancing the table base pointer by 16 bytes and reading all 16
 * entries via a runtime loop counter (computed-stride), with a hard
 * `cmp ctr,#0x4` bound proving exactly 4x16=64 elements from the
 * consumer's own control flow. Round-1 rotate amounts (7/12/17/22) and
 * F/G/H/I bitwise patterns independently confirm MD5. Byte values are an
 * exact match for MD5's canonical g(i) table: round 1 g(i)=i, round 2
 * g(i)=(1+5i)%16, round 3 g(i)=(5+3i)%16, round 4 g(i)=7i%16. Already
 * independently corroborated by docs/research/dossiers/020770bc.md,
 * which identified the caller-side struct's dispatch flag as
 * "==3 -> MD5 arm" from unrelated struct-field analysis. Not `const`:
 * the original lives in `.data`, not `.rodata` (verified via
 * delinks.txt). See docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

unsigned char data_02101f34[4][16] = {
    { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
      0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f },
    { 0x01, 0x06, 0x0b, 0x00, 0x05, 0x0a, 0x0f, 0x04,
      0x09, 0x0e, 0x03, 0x08, 0x0d, 0x02, 0x07, 0x0c },
    { 0x05, 0x08, 0x0b, 0x0e, 0x01, 0x04, 0x07, 0x0a,
      0x0d, 0x00, 0x03, 0x06, 0x09, 0x0c, 0x0f, 0x02 },
    { 0x00, 0x07, 0x0e, 0x05, 0x0c, 0x03, 0x0a, 0x01,
      0x08, 0x0f, 0x06, 0x0d, 0x04, 0x0b, 0x02, 0x09 },
};
