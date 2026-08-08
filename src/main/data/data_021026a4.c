/* data_021026a4 (52 bytes, 4-aligned): cumulative "days before month"
 * table for a non-leap year, 13 x int, indexed directly by 1-based
 * month number (index 0 is an unused padding slot -- the consumer's
 * month argument is range-checked to 1..12 and used as the raw array
 * index, never month-1). index 1 (Jan) = 0, index 2 (Feb) = 31, index 3
 * (Mar) = 59, ... index 12 (Dec) = 334 -- standard non-leap-year
 * cumulative day-of-year offsets; caller separately adds +1 for
 * Mar-Dec of a leap year.
 * Consumer: func_0209bf34 (date-struct validate + days-since-epoch),
 * src/main/func_0209bf34.s:34,36 (_LIT0, `data_021026a4[month]`)
 * (relocs.txt:17385 from:0x0209bfc0 kind:load to:0x021026a4
 * module:main). A campaign-prep candidate at
 * docs/research/c-match-prep/0209bf34.c independently inferred the same
 * shape/semantics but typed it `const int[]`; per section discipline
 * (delinks.txt line 4, this address is inside .data) the real
 * declaration here must NOT be const.
 */
int data_021026a4[13] = {
    0, 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334,
};
