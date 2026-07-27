/* data_020fe49c -- SDAT filename-suffix string literal (20 bytes).
 *
 * Sole consumer func_02034d58.s: `strcat(data_020bebec, data_020fe49c)`
 * via func_020aaf10.s (a byte-exact strcat implementation). Content
 * confirmed by direct extraction from extract/eur/arm9/arm9.bin at
 * this address, and independently cross-matched against a real file
 * already present in the extracted ROM filesystem:
 * extract/eur/files/sound/ds_data_hed.sdat. Carved from a previously-
 * unclaimed delinks.txt gap. See docs/queue/claude-scaffolder.md
 * (cm-data-inference-5).
 */

char data_020fe49c[20] = "ds_data_hed.sdat";
