/* func_ov002_0220a748: 021ff320 forwarding predicate — require the query,
 * then return 2 if 022577dc(self) reports >= 2. */

extern int func_ov002_021ff230(void *self);
extern int func_ov002_022576f4(void *self);

int func_ov002_0220a748(void *self) {
    if (func_ov002_021ff230(self) == 0)
        return 0;
    if (func_ov002_022576f4(self) >= 2)
        return 2;
    return 0;
}
