/* data_020fe4b0 -- SDAT filename string literal (16 bytes, exact fit).
 *
 * Sole consumer func_02034d58.s: `strcat(data_020beb8c, data_020fe4b0)`
 * via func_020aaf10.s (a byte-exact strcat implementation). Content
 * confirmed by direct extraction from extract/eur/arm9/arm9.bin at
 * this address, and independently cross-matched against a real file
 * already present in the extracted ROM filesystem:
 * extract/eur/files/sound/sound_data.sdat. Carved from a previously-
 * unclaimed delinks.txt gap. See docs/queue/claude-scaffolder.md
 * (cm-data-inference-5).
 */

char data_020fe4b0[16] = "sound_data.sdat";
