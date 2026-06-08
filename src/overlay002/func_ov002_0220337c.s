; func_ov002_0220337c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc55c
        .global func_ov002_0220337c
        .arm
func_ov002_0220337c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, #0x0
    mov r5, r7
    mov r4, r7
.L_10:
    mov r6, r4
.L_14:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021bc55c
    cmp r0, #0x0
    add r6, r6, #0x1
    addne r7, r7, #0x1
    cmp r6, #0x4
    ble .L_14
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_10
    cmp r7, #0x1
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
