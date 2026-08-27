/* func_ov006_021c7dd0: nested-loop search over self's i(f7c)/j(f78) grid,
 * calling func_ov006_021c9b48(self,j,i) for each cell; on a match against
 * `target`, records the (j,i) coordinates at f80/f84 and returns 1. 0 if
 * exhausted.
 */
extern int func_ov006_021c9b48(void *self, int j, int i);

int func_ov006_021c7dd0(void *self_, int target) {
    int j, i;
    int *self = (int *)self_;

    for (i = 0; i < self[0x1f]; i++) {
        for (j = 0; j < self[0x1e]; j++) {
            if (func_ov006_021c9b48(self, j, i) == target) {
                self[0x20] = j;
                self[0x21] = i;
                return 1;
            }
        }
    }
    return 0;
}
