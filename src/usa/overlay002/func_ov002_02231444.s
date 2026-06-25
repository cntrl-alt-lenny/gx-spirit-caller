; func_ov002_02231444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021d6ba8
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02257564
        .global func_ov002_02231444
        .arm
func_ov002_02231444:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    bl func_ov002_021e2a4c
    mov r6, #0x0
    ldr r4, _LIT0
    mov r5, r6
.L_1228:
    ldr r0, [r4, #0xcec]
    mov r8, r5
    eor r7, r0, r6
.L_1234:
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_125c
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_021d6ba8
.L_125c:
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_1234
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_1228
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d008c
