; func_ov002_0229049c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0229049c
        .arm
func_ov002_0229049c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    mov sl, r0
    mov r7, r6
    mov r9, r6
    mov r4, #0x1
    mov r5, r6
    mov fp, r6
.L_20:
    mov r8, fp
.L_24:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    blx sl
    cmp r0, #0x0
    addne r0, r8, r9
    add r8, r8, #0x1
    orrne r6, r6, r4, lsl r0
    cmp r8, #0xa
    ble .L_24
    add r7, r7, #0x1
    cmp r7, #0x2
    add r9, r9, #0x10
    blt .L_20
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
