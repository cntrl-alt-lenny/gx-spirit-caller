; func_ov002_0221209c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021d63fc
        .extern func_ov002_0225764c
        .global func_ov002_0221209c
        .arm
func_ov002_0221209c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, #0x0
    ldr r6, _LIT0
    mov r5, r0
    mov r7, #0x1
    mov r8, r9
.L_550:
    ldr r0, [r6, #0xcec]
    mov r4, r8
    eor sl, r0, r9
.L_55c:
    mov r0, r5
    mov r1, sl
    mov r2, r4
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_588
    mov r0, r5
    mov r1, sl
    mov r2, r4
    mov r3, r7
    bl func_ov002_021d63fc
.L_588:
    add r4, r4, #0x1
    cmp r4, #0xa
    ble .L_55c
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_550
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
