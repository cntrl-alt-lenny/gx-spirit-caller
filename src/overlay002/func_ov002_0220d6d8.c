/* func_ov002_0220d6d8: require the 021ed4c0 query, then report the 021eb964
 * query (both run through 02257878). */
extern int func_ov002_02257878(void *self, void *fn);
extern int func_ov002_021ed4c0(void);
extern int func_ov002_021eb964(void);

int func_ov002_0220d6d8(void *self) {
    if (func_ov002_02257878(self, (void *)func_ov002_021ed4c0) == 0)
        return 0;
    return func_ov002_02257878(self, (void *)func_ov002_021eb964) != 0;
}
