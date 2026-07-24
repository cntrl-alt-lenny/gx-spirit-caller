/* func_ov002_021b1d48: count entries in an 8-byte-stride table whose low-4-bit
 * field (a :4 bitfield) is nonzero, starting at d065a (== d056c+0xee). Head is
 * read via d056c+0xee (distinct literal); the loop pre-increments by 8. Returns
 * count (>=1); 1 if the head's field is already 0. */

typedef unsigned short u16;

extern char data_ov002_022d056c[];
extern char data_ov002_022d065a[];

struct E1d48 { u16 tag : 4; u16 _rest : 12; u16 _pad0; u16 _pad1; u16 _pad2; };

int func_ov002_021b1d48(void) {
    struct E1d48 *p;
    int count = 1;
    if (((struct E1d48 *)(data_ov002_022d056c + 0xee))->tag == 0) {
        return 1;
    }
    p = (struct E1d48 *)data_ov002_022d065a;
    do {
        ++p;
        ++count;
    } while (p->tag != 0);
    return count;
}
