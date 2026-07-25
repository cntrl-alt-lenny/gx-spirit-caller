/* func_ov002_022479f0 — C-34 address-CSE duplicate pool slot (re-audit,
 * brief 207 Phase 2 retry). data_ov002_022cabc0 is referenced from two
 * distinct pool words at offset 0 both sites (same shape as
 * func_ov002_02247600). Technique 1: the second (looping) site is
 * coerced through a literal-address cast so mwasmarm's symbol-based
 * literal-pool dedup cannot collapse it against the first (plain
 * symbol-reference) site. See docs/research/codegen-walls.md C-34 and
 * src/main/func_0202a178.c for the worked reference example.
 */

extern int func_ov002_021ca1d8(int arg0);
extern int func_ov002_021baf88(int arg0);
extern int func_ov002_02247700(void *arg0, int arg1);

struct Ov002Item {
    unsigned int id : 13;
};
extern struct Ov002Item data_ov002_022cabc0[];

struct Ce288Sub {
    short pad0;
    unsigned short flag : 1;
};

int func_ov002_022479f0(struct Ce288Sub *arg0) {
    int i;
    struct Ov002Item *p;

    if (func_ov002_021ca1d8(arg0->flag) == 0) {
        return 0;
    }
    if (func_ov002_021baf88(0x13f2) != 0) {
        return 0;
    }
    i = 0;
    if (data_ov002_022cabc0[0].id != 0) {
        p = (struct Ov002Item *)0x022cabc0;
        do {
            if (func_ov002_02247700(arg0, i) != 0) {
                return 1;
            }
            p++;
            i++;
        } while (p->id != 0);
    }
    return 0;
}
