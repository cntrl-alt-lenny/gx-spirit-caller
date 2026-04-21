/* func_ov011_021c9e80: indirect tail-call to whatever code lives at
 * the shared overlay-swap address data_ov000_021b1888 at runtime.
 *
 *     ldr ip, =data_ov000_021b1888
 *     bx  ip
 *
 * The label `data_ov000_021b1888` has siblings at the same address in
 * ov005/ov009/ov021 (overlay-swap region). dsd tracks them as distinct
 * symbols; we point at the ov000 one and let the linker's trampoline
 * layer handle dispatch. Writing as cast-call + tail so mwcc -O4,p
 * emits the same 2-instruction shape.
 */

extern char data_ov000_021b1888[];

void func_ov011_021c9e80(void) {
    ((void (*)(void))data_ov000_021b1888)();
}
