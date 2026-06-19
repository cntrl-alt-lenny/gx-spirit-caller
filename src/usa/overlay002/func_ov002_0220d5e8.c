/* func_ov002_0220d5e8: require the 021ed4c0 query, then report the 021eb964
 * query (both run through 02257878). */
extern int func_ov002_02257790(void *self, void *fn);
extern int func_ov002_021ed3d0(void);
extern int func_ov002_021eb874(void);

int func_ov002_0220d5e8(void *self) {
    if (func_ov002_02257790(self, (void *)func_ov002_021ed3d0) == 0)
        return 0;
    return func_ov002_02257790(self, (void *)func_ov002_021eb874) != 0;
}
