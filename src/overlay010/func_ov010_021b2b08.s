; func_ov010_021b2b08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208dd9c
        .extern func_0208ddec
        .extern func_0208de4c
        .extern func_0208de94
        .extern Vram_GetBankBaseE
        .extern func_0208df0c
        .extern Vram_GetBankBaseCD
        .extern func_0208df60
        .global func_ov010_021b2b08
        .arm
func_ov010_021b2b08:
    stmdb sp!, {r3, lr}
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_254
    b .L_214
    b .L_21c
    b .L_224
    b .L_22c
    b .L_234
    b .L_23c
    b .L_244
    b .L_24c
.L_214:
    bl func_0208df60
    ldmia sp!, {r3, pc}
.L_21c:
    bl func_0208df0c
    ldmia sp!, {r3, pc}
.L_224:
    bl func_0208de94
    ldmia sp!, {r3, pc}
.L_22c:
    bl func_0208ddec
    ldmia sp!, {r3, pc}
.L_234:
    bl Vram_GetBankBaseCD
    ldmia sp!, {r3, pc}
.L_23c:
    bl Vram_GetBankBaseE
    ldmia sp!, {r3, pc}
.L_244:
    bl func_0208de4c
    ldmia sp!, {r3, pc}
.L_24c:
    bl func_0208dd9c
    ldmia sp!, {r3, pc}
.L_254:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
