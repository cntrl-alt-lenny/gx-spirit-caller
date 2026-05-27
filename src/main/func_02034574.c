/* func_02034574: C-42 — 7-helper void thunk.
 *
 *   push {r3, lr}
 *   bl func_0203268c; bl func_020331b0; bl func_02032350; bl func_020323f4
 *   bl func_02031eac; bl func_020320c8; mov r0, #0; bl func_02034174; pop
 */

extern void func_0203268c(void);
extern void func_020331b0(void);
extern void func_02032350(void);
extern void func_020323f4(void);
extern void func_02031eac(void);
extern void func_020320c8(void);
extern void func_02034174(int x);

void func_02034574(void) {
    func_0203268c();
    func_020331b0();
    func_02032350();
    func_020323f4();
    func_02031eac();
    func_020320c8();
    func_02034174(0);
}
