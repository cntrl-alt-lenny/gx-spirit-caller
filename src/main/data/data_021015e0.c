/* Cluster B pointer singleton brief 148 — data-pointer slot
 * pointing at an already-claimed typed array.
 *
 * data_021015e0 holds a 4-byte pointer to data_021015e4, which is
 * already claimed in src/main/data_021015e4.c as an
 * `unsigned char[272]`. The recipe uses the same opaque
 * `extern char` declaration brief 121 / D-1 wave 2 settled on,
 * not the array type — multiple `extern` declarations with
 * different types resolve to the same symbol at link time, and
 * the opaque form keeps the recipe uniform across slots whose
 * pointees may or may not already be claimed.
 */

extern char data_021015e4;

void *data_021015e0 = &data_021015e4;
