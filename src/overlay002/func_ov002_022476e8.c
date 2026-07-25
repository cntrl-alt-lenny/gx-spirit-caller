/* func_ov002_022476e8 — C-34 address-CSE duplicate pool slot (re-audit,
 * brief 207 Phase 2 retry). data_ov002_022cacc0 is referenced from two
 * distinct pool words at offset 0 both sites. Technique 1: the second
 * site is coerced through a literal-address cast (genuine numeric literal
 * equal to the symbol's runtime address, offset-0 field access) so
 * mwasmarm's symbol-based literal-pool dedup cannot collapse it against
 * the first (plain symbol-reference) site. See docs/research/codegen-walls.md
 * C-34 and src/main/func_0202a1cc.c for the worked reference example.
 */

extern int func_ov002_022477e8(void *arg0, int arg1);

struct Ov002Item {
    unsigned int id : 13;
};
extern struct Ov002Item data_ov002_022cacc0[];

struct Ce288Sub {
    short pad0;
    unsigned short flag : 1;
};

struct ce288 {
    char _pad[0x48c];
    struct Ce288Sub *f1164;
};
extern struct ce288 data_ov002_022ce288;

extern char data_ov002_022cf16c[];

int func_ov002_022476e8(int arg0, int arg1, int arg2) {
    int i;
    struct Ov002Item *p;
    struct Ov002Item *base;

    if (arg0 == data_ov002_022ce288.f1164->flag && arg1 == 0xb) {
        i = 0;
        if (data_ov002_022cacc0[0].id != 0) {
            base = (struct Ov002Item *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x120);
            p = (struct Ov002Item *)0x022cacc0;
            do {
                if (p->id == base[arg2].id) {
                    if (func_ov002_022477e8(data_ov002_022ce288.f1164, i) != 0) {
                        return 0x800;
                    }
                }
                p++;
                i++;
            } while (p->id != 0);
        }
    }
    return 0;
}
