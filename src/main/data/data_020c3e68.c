/* Cluster B pointer singleton brief 148 — data-pointer slot.
 *
 * data_020c3e68 holds a 4-byte pointer to data_020c3e5c (12 bytes
 * earlier in the same .data run; an int constant). Pattern shared
 * with the brief 130 / D-1 wave 2 dispatch tables: opaque
 * `extern char` declaration of the pointee + `void *` slot
 * initialised with `&pointee`. mwldarm emits a reloc that resolves
 * to data_020c3e5c's existing address — no need for the pointee
 * to be source-claimed first.
 */

extern char data_020c3e5c;

void *data_020c3e68 = &data_020c3e5c;
