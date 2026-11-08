typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { unsigned int id:13; unsigned int bit13:1; unsigned int rest:8; unsigned int high:8; unsigned int tail:2; } Word;
typedef struct { u16 pair; unsigned short type:4; unsigned short unused:12; u16 value; u16 next; } Node;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a6[];
extern Node data_ov002_022d0650[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021b422c(int arg0, int arg1);
extern int func_ov002_021c1ad0(int self, int idx);
extern int func_ov002_021c1d4c(int self, int idx);
/* The original call supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021c84e0();
extern int func_ov002_021c93cc(int a, int b, int bit);
int func_ov002_021c84f0(int self, int idx, int mode) {
    int id, cid, slot, n, off, other, i, result, immunity, immunity2;
    off = (self & 1) * 0x868;
    slot = idx * 20;
    id = ((Word *)(data_ov002_022cf16c + off + 0x30 + slot))->id;
    immunity = func_ov002_021c1ad0(self, idx);
    immunity2 = func_ov002_021c1d4c(self, idx);
    if (id == 0) return 0;
    result = func_0202b8a8(id);
    if (idx >= 5) return result;
    if (*(u16 *)(data_ov002_022cf1a4 + off + slot) == 0) return result;
    if (id == 0x19ed) {
        int pair = func_ov002_021b3618(self, idx);
        if (pair != 0xffff)
            return func_ov002_021c84e0((unsigned char)pair, (unsigned char)((u16)pair >> 8));
    }
    if (mode == 0) {
        Word *w = (Word *)((char *)((u32)data_ov002_022cf16c + off + 0x30) + slot);
        int v = func_ov002_021b422c(w->high * 2 + w->bit13, 0x18d9);
        if (v > 0) result = v;
    }
    n = *(u16 *)(data_ov002_022cf1a6 + off + slot);
    while (n != 0) {
        Node *p = &data_ov002_022d0650[n];
        int type = p->type;
        int pair = p->pair;
        other = (unsigned char)pair;
        int index = (unsigned char)(pair >> 8);
        n = p->next;
        switch (type) {
        case 1:
            if (mode != 0) break;
            switch (pair) {
            case 0x15c7:
                result -= p->value * 2;
                if (result < 1) result = 1;
            }
            break;
        case 5:
            switch (pair) {
            case 0x1602: case 0x1608:
                result = (unsigned char)((p->value & 0xf0) >> 4);
                n = data_ov002_022d0650[data_ov002_022d0650[n].next].next;
                break;
            case 0x1472:
                switch (id) {
                case 0x1472: case 0x172f: case 0x1809: case 0x1aca:
                    result = 4; break;
                case 0x1636: result = 10; break;
                }
                break;
            }
            break;
        case 10:
            if (mode == 0) {
                char *q = data_ov002_022cf16c + (other & 1) * 0x868 + index * 20;
                cid = ((Word *)(q + 0x30))->id;
                if (cid != 0 && ((*(u32 *)(q + 0x40) >> 6) & 1) == 0) {
                    if (func_0202b878(cid) == 0x17) {
                        if ((immunity2 & ((self != other) + 1)) <= 0) { } else break;
                    } else {
                        if ((immunity & ((self != other) + 1)) > 0) break;
                    }
                    if (cid == 0x15e3 && result != 0) {
                        result -= 2;
                        if (result < 1) result = 1;
                    }
                }
            }
            break;
        }
    }
    if (mode == 0) {
        for (i = 0; i < 2; i++) {
            int offset = (i & 1) * 0x868;
            int fieldId = ((Word *)(data_ov002_022cf16c + offset + 0xf8))->id;
            if (fieldId != 0) {
                u32 flags = *(u32 *)(data_ov002_022cf16c + offset + 0x108);
                if ((*(u16 *)(data_ov002_022cf16c + offset + 0x100) & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) != 0 && (immunity & ((self != i) + 1)) <= 0 && fieldId == 0x150b && func_ov002_021c93cc(self, idx, 3) != 0) {
                    result--;
                    if (result < 1) result = 1;
                }
            }
        }
    }
    return result;
}



