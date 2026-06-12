; func_ov002_022ae284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0225929c
        .global func_ov002_022ae284
        .arm
func_ov002_022ae284:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_0225929c
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_229c
    b .L_229c
    b .L_229c
    b .L_228c
    b .L_228c
    b .L_2294
    b .L_2294
    b .L_2294
    b .L_2294
    b .L_2294
    b .L_229c
    b .L_229c
.L_228c:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_2294:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_229c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
