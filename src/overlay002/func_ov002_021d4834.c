/* func_ov002_021d4834: append (a,b,c,d) as the next slot in a per-entry
 * 8-byte-stride record (4 parallel u16 fields, each with its own symbol),
 * indexed by data_ov002_022ce950.f808 (capped at 0x100), then advance
 * f808. volatile is deliberate -- the check+first store share one cached
 * read, but each later store/the increment independently re-reads f808,
 * matching the original's repeated loads. */
typedef struct {
    char _pad0[0x808];
    volatile int f808;
} S021d4834;

extern S021d4834 data_ov002_022ce950;
extern unsigned short data_ov002_022ce958[];
extern unsigned short data_ov002_022ce95a[];
extern unsigned short data_ov002_022ce95c[];
extern unsigned short data_ov002_022ce95e[];

void func_ov002_021d4834(unsigned short a, unsigned short b, unsigned short c, unsigned short d) {
    int idx = data_ov002_022ce950.f808;
    if ((unsigned int)idx >= 0x100)
        return;

    *(unsigned short *)((char *)data_ov002_022ce958 + idx * 8) = a;
    *(unsigned short *)((char *)data_ov002_022ce95a + data_ov002_022ce950.f808 * 8) = b;
    *(unsigned short *)((char *)data_ov002_022ce95c + data_ov002_022ce950.f808 * 8) = c;
    *(unsigned short *)((char *)data_ov002_022ce95e + data_ov002_022ce950.f808 * 8) = d;
    data_ov002_022ce950.f808 = data_ov002_022ce950.f808 + 1;
}
