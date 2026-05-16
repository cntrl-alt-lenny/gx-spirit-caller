/* Brief 117 cluster B worked example — single .data scalar (singleton).
 *
 * Pool: 1 of 247 cluster B candidates (--cluster B per brief 113 taxonomy).
 * Address 0x020c3e48, size 4 bytes, value 1 (= 0x01 little-endian).
 * Cross-module readers: 5 (per brief 114 worklist).
 *
 * Recipe: declare scalar in a single-symbol .c file. mwcc 2.0/sp1p5
 * emits one .data section with the variable's bytes at offset 0;
 * mwldarm places the .data section at the delinks.txt-claimed address.
 *
 * Multi-symbol .c files reorder by mwcc-internal heuristic (NOT
 * declaration order, NOT address order), so the singleton-per-file
 * pattern is the safe default. Multi-symbol grouping needs the .s
 * approach (per brief 115's DTCM precedent).
 */

int data_020c3e48 = 1;
