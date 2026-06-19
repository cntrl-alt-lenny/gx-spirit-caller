/* func_ov017_021b7230: dispatch the sub-scene's pending input events. If the
 * "reset" flag (fd8 & 0x40) is set, run the reset; otherwise fire the three
 * guarded handlers for the fda flag bits. Returns 1. (The first handler keeps
 * self in r0 from the param — orig omits the `mov r0,r4` there.)
 */

extern char data_ov017_021b8128[];
extern void func_ov017_021b758c(void);
extern void func_ov017_021b72a8(void *self, void *tbl);
extern void func_ov017_021b7390(void *self, void *tbl);
extern void func_ov017_021b7478(void *self, void *tbl);

typedef struct {
    char pad[0xd8];
    unsigned short fd8;
    unsigned short fda;
} SceneFlags;

int func_ov017_021b7230(char *self) {
    if (((SceneFlags *)(self + 0x100))->fd8 & 0x40) {
        func_ov017_021b758c();
    } else {
        if (((SceneFlags *)(self + 0x100))->fda & 4) func_ov017_021b72a8(self, data_ov017_021b8128);
        if (((SceneFlags *)(self + 0x100))->fda & 8) func_ov017_021b7390(self, data_ov017_021b8128);
        if (((SceneFlags *)(self + 0x100))->fda & 0x10) func_ov017_021b7478(self, data_ov017_021b8128);
    }
    return 1;
}
