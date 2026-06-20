; func_ov002_022647c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021b3e5c
        .extern func_ov002_021b4160
        .extern func_ov002_021bae7c
        .extern func_ov002_021d5be0
        .extern func_ov002_021e30b4
        .global func_ov002_022647c8
        .arm
func_ov002_022647c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    mov sl, r0
    ldr r0, [r4, #0xd28]
    cmp r0, #0x2
    bcs .L_e8
    ldr r8, _LIT1
    mvn r6, #0x0
    mov fp, #0xb
.L_24:
    eor r9, sl, r0
    mov r0, r9
    mov r1, fp
    mov r2, r8
    mov r3, #0x1
    bl func_ov002_021b4160
    mov r7, r0
    cmp r7, #0x0
    ble .L_d4
    ldr r1, _LIT2
    rsb r0, r9, #0x1
    mov r2, r6
    bl func_ov002_021bae7c
    cmp r0, #0x0
    bne .L_d4
    mov r0, r9
    mov r1, #0xb
    mov r2, r8
    mov r3, #0x1
    bl func_ov002_021b3e5c
    mov r5, r0
    mov r0, r9
    mov r1, #0xb
    mov r2, r8
    mov r3, #0x2
    bl func_ov002_021b3e5c
    muls r2, r5, r0
    beq .L_d4
    mov r3, r9, lsl #0x1f
    mov r1, r7, lsl #0x10
    ldr r0, _LIT3
    and r3, r3, #-2147483648
    orr r0, r3, r0
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    mov r4, #0x1
    ldr r2, _LIT1
    mov r0, r9
    mov r1, #0xb
    mov r3, #0x2
    str r4, [sp]
    bl func_ov002_021d5be0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    ldr r0, [r4, #0xd28]
    add r0, r0, #0x1
    str r0, [r4, #0xd28]
    cmp r0, #0x2
    bcc .L_24
.L_e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x000014e2
_LIT2: .word 0x0000178b
_LIT3: .word 0x0a5014e2
