/* CAMPAIGN-PREP candidate for func_021b4fdc (ov019, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack ptrs stored at sp+0x1c..0x28; id==0x37 + low-5-bit test; 4x 02091554 per arm.
 *   risk:       struct-guessed: asm is TRUNCATED past .L_198 — default arm tail, .L_1d8 join, post-format code, frame size (0x12c) and literal->label mapping are reconstructed; the whole back half is unverified and almost certainly incomplete.
 *   confidence: low
 */
/* func_ov019_021b4fdc: lay out four text-line scratch buffers (0x40 each)
 * on the stack, stash their pointers, query a line-id via 021b4f1c; if it
 * equals 0x37 pick one of two label-sets based on a low bit of a global,
 * else use a default label-set; each set fills the four buffers via
 * 02091554(buf, label, id).
 *
 * NOTE: batch asm is TRUNCATED at .L_198 (size 780 / shown 90 lines); the
 * tail (default-block remaining two 02091554 calls, the .L_1d8 join, and
 * the per-buffer formatting after) is reconstructed by symmetry and the
 * literal pool / final dispatch are GUESSED.
 *
 *   bufs at sp+0x2c/0x6c/0xac/0xec; ptrs stored at sp+0x1c/0x20/0x24/0x28
 *   id = func_ov019_021b4f1c(r0=arg)
 *   if id==0x37: if ((data_02104f4c.f4 >> 0x1d) & 7)==0 set A else set B
 *   else set DEFAULT
 */

typedef struct { char _pad4[4]; unsigned int f_4; } S_104f4c;
extern S_104f4c data_02104f4c;
extern char data_ov019_021b5cb4[];
extern char data_ov019_021b5ccc[];
extern char data_ov019_021b5ce4[];
extern char data_ov019_021b5cfc[];
extern char data_ov019_021b5d14[];
extern char data_ov019_021b5d2c[];
extern char data_ov019_021b5d44[];
extern char data_ov019_021b5d5c[];
extern char data_ov019_021b5d74[];
extern char data_ov019_021b5d8c[];
extern char data_ov019_021b5da4[];
extern char data_ov019_021b5dbc[];
extern void func_02091554(void *dst, void *label, int id);
extern int  func_ov019_021b4f1c(int arg);

void func_ov019_021b4fdc(int arg) {
    char b0[0x40];
    char b1[0x40];
    char b2[0x40];
    char b3[0x40];
    void *p0 = b0;
    void *p1 = b1;
    void *p2 = b2;
    void *p3 = b3;
    int id;

    id = func_ov019_021b4f1c(arg);
    if (id == 0x37) {
        if (((data_02104f4c.f_4 << 0x1d) >> 0x1d) == 0) {
            func_02091554(p0, data_ov019_021b5cb4, id);
            func_02091554(p1, data_ov019_021b5ccc, id);
            func_02091554(p2, data_ov019_021b5ce4, id);
            func_02091554(p3, data_ov019_021b5cfc, id);
        } else {
            func_02091554(p0, data_ov019_021b5d14, id);
            func_02091554(p1, data_ov019_021b5d2c, id);
            func_02091554(p2, data_ov019_021b5d44, id);
            func_02091554(p3, data_ov019_021b5d5c, id);
        }
    } else {
        func_02091554(p0, data_ov019_021b5d74, id);
        func_02091554(p1, data_ov019_021b5d8c, id);
        func_02091554(p2, data_ov019_021b5da4, id);
        func_02091554(p3, data_ov019_021b5dbc, id);
    }
}
