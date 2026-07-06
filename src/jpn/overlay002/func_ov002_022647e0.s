; func_ov002_022647e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b4040
        .extern func_ov002_021b939c
        .extern func_ov002_021d5a90
        .extern func_ov002_021e2fc4
        .global func_ov002_022647e0
        .arm
func_ov002_022647e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r7, _LIT0
    mov r6, r0
    ldr r0, [r7, #0xd28]
    cmp r0, #0x2
    bcs .L_1ac
    ldr r8, _LIT1
    mov r9, #0xb
.L_120:
    eor r5, r6, r0
    mov r0, r5
    mov r1, r9
    mov r2, r8
    bl func_ov002_021b4040
    mov r4, r0
    cmp r4, #0x0
    ble .L_198
    bl func_ov002_021b939c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xe
    bne .L_17c
    mov r2, r5, lsl #0x1f
    mov r1, r4, lsl #0x10
    ldr r0, _LIT2
    and r2, r2, #-2147483648
    orr r0, r2, r0
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_17c:
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5a90
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_198:
    ldr r0, [r7, #0xd28]
    add r0, r0, #0x1
    str r0, [r7, #0xd28]
    cmp r0, #0x2
    bcc .L_120
.L_1ac:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x000013a6
_LIT2: .word 0x0a4e13a6
