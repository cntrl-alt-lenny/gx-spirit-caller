; func_ov002_0227d508 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0227d4ec
        .global func_ov002_0227d508
        .arm
func_ov002_0227d508:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, #0x0
    mov sl, r0
    mov r9, r1
    mov r6, r5
    mov r8, r5
    mov r4, #0x1
    mov fp, r5
.L_20:
    mov r7, fp
.L_24:
    mov r0, sl
    mov r1, r6
    mov r2, r7
    mov r3, r9
    bl func_ov002_0227d4ec
    cmp r0, #0x0
    addne r0, r7, r8
    add r7, r7, #0x1
    orrne r5, r5, r4, lsl r0
    cmp r7, #0x4
    ble .L_24
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0x10
    blt .L_20
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
