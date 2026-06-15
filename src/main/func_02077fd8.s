; func_02077fd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101f34
        .extern data_02101fb4
        .extern func_0207842c
        .global func_02077fd8
        .arm
func_02077fd8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    str r0, [sp]
    ldr r3, [sp]
    add r0, sp, #0x4
    mov r2, #0x40
    ldr r7, [r3]
    ldr r6, [r3, #0x4]
    ldr r5, [r3, #0x8]
    ldr r4, [r3, #0xc]
    bl func_0207842c
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r1, _LIT1
    mov fp, r3
    add r0, sp, #0x4
    mov sl, r2
.L_44:
    ldrb r9, [r2]
    add r8, r3, #0x1
    eor ip, r5, r4
    and ip, r6, ip
    eor ip, r4, ip
    ldr r9, [r0, r9, lsl #0x2]
    ldr lr, [r1, r3, lsl #0x2]
    add r9, ip, r9
    add r9, lr, r9
    add r9, r7, r9
    mov r7, r9, lsl #0x7
    orr r7, r7, r9, lsr #0x19
    ldrb r9, [sl, r8]
    add r7, r6, r7
    ldr r8, [r1, r8, lsl #0x2]
    ldr r9, [r0, r9, lsl #0x2]
    eor ip, r6, r5
    and ip, r7, ip
    eor ip, r5, ip
    add r9, ip, r9
    add r9, r8, r9
    add r8, r3, #0x2
    add r9, r4, r9
    mov r4, r9, lsl #0xc
    orr r4, r4, r9, lsr #0x14
    add r4, r7, r4
    ldr r9, [r1, r8, lsl #0x2]
    ldrb ip, [sl, r8]
    eor r8, r7, r6
    and r8, r4, r8
    eor r8, r6, r8
    ldr lr, [r0, ip, lsl #0x2]
    add ip, r3, #0x3
    add r8, r8, lr
    add r8, r9, r8
    add r8, r5, r8
    mov r5, r8, lsl #0x11
    orr r5, r5, r8, lsr #0xf
    add r5, r4, r5
    ldr r9, [r1, ip, lsl #0x2]
    ldrb ip, [sl, ip]
    eor r8, r4, r7
    and r8, r5, r8
    eor r8, r7, r8
    ldr ip, [r0, ip, lsl #0x2]
    add r2, r2, #0x4
    add r8, r8, ip
    add r8, r9, r8
    add r8, r6, r8
    mov r6, r8, lsl #0x16
    orr r6, r6, r8, lsr #0xa
    add r6, r5, r6
    add r3, r3, #0x4
    add fp, fp, #0x1
    cmp fp, #0x4
    blt .L_44
    add r8, sl, r3
    mov r2, #0x0
    ldr r1, _LIT1
    add r0, sp, #0x4
    ldr lr, _LIT0
.L_138:
    ldrb sl, [r8]
    add r9, r3, #0x1
    eor fp, r6, r5
    and fp, r4, fp
    eor fp, r5, fp
    ldr sl, [r0, sl, lsl #0x2]
    ldr ip, [r1, r3, lsl #0x2]
    add sl, fp, sl
    add sl, ip, sl
    add sl, r7, sl
    mov r7, sl, lsl #0x5
    orr r7, r7, sl, lsr #0x1b
    ldrb sl, [lr, r9]
    add r7, r6, r7
    ldr r9, [r1, r9, lsl #0x2]
    ldr sl, [r0, sl, lsl #0x2]
    eor fp, r7, r6
    and fp, r5, fp
    eor fp, r6, fp
    add sl, fp, sl
    add sl, r9, sl
    add r9, r3, #0x2
    add sl, r4, sl
    mov r4, sl, lsl #0x9
    orr r4, r4, sl, lsr #0x17
    add r4, r7, r4
    ldr ip, [r1, r9, lsl #0x2]
    ldrb r9, [lr, r9]
    eor sl, r4, r7
    and sl, r6, sl
    eor fp, r7, sl
    ldr sl, [r0, r9, lsl #0x2]
    add r9, r3, #0x3
    add sl, fp, sl
    add sl, ip, sl
    add sl, r5, sl
    mov r5, sl, lsl #0xe
    orr r5, r5, sl, lsr #0x12
    add r5, r4, r5
    ldr sl, [r1, r9, lsl #0x2]
    ldrb fp, [lr, r9]
    eor r9, r5, r4
    and r9, r7, r9
    eor r9, r4, r9
    ldr fp, [r0, fp, lsl #0x2]
    add r8, r8, #0x4
    add r9, r9, fp
    add r9, sl, r9
    add r9, r6, r9
    mov r6, r9, lsl #0x14
    orr r6, r6, r9, lsr #0xc
    add r6, r5, r6
    add r3, r3, #0x4
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_138
    add r8, lr, r3
    mov lr, #0x0
    ldr r2, _LIT1
    add r0, sp, #0x4
.L_228:
    ldrb r1, [r8]
    eor ip, r6, r5
    add lr, lr, #0x1
    ldr fp, [r0, r1, lsl #0x2]
    eor ip, r4, ip
    ldr r1, [r2, r3, lsl #0x2]
    add fp, ip, fp
    add r1, r1, fp
    add r7, r7, r1
    mov r1, r7, lsl #0x4
    orr r1, r1, r7, lsr #0x1c
    add r7, r6, r1
    add sl, r3, #0x1
    ldr r1, _LIT0
    ldr ip, [r2, sl, lsl #0x2]
    ldrb r1, [r1, sl]
    eor sl, r7, r6
    eor fp, r5, sl
    ldr sl, [r0, r1, lsl #0x2]
    add r9, r3, #0x2
    add sl, fp, sl
    add sl, ip, sl
    add r4, r4, sl
    ldr sl, _LIT0
    ldr r1, [r2, r9, lsl #0x2]
    ldrb r9, [sl, r9]
    mov sl, r4, lsl #0xb
    orr r4, sl, r4, lsr #0x15
    add r4, r7, r4
    eor sl, r4, r7
    ldr r9, [r0, r9, lsl #0x2]
    eor sl, r6, sl
    add r9, sl, r9
    add r1, r1, r9
    add r5, r5, r1
    add sl, r3, #0x3
    ldr r9, _LIT0
    mov r1, r5, lsl #0x10
    ldrb r9, [r9, sl]
    orr r1, r1, r5, lsr #0x10
    add r5, r4, r1
    ldr r1, [r2, sl, lsl #0x2]
    eor sl, r5, r4
    ldr r9, [r0, r9, lsl #0x2]
    eor sl, r7, sl
    add r9, sl, r9
    add r1, r1, r9
    add r6, r6, r1
    mov r1, r6, lsl #0x17
    orr r1, r1, r6, lsr #0x9
    add r8, r8, #0x4
    add r6, r5, r1
    add r3, r3, #0x4
    cmp lr, #0x4
    blt .L_228
    ldr r0, _LIT0
    ldr r1, _LIT1
    add r8, r0, r3
    ldr lr, _LIT0
    mov r2, #0x0
    add r0, sp, #0x4
.L_31c:
    ldrb sl, [r8]
    add r9, r3, #0x1
    mvn fp, r4
    orr fp, r6, fp
    eor fp, r5, fp
    ldr sl, [r0, sl, lsl #0x2]
    ldr ip, [r1, r3, lsl #0x2]
    add sl, fp, sl
    add sl, ip, sl
    add sl, r7, sl
    mov r7, sl, lsl #0x6
    orr r7, r7, sl, lsr #0x1a
    ldrb sl, [lr, r9]
    add r7, r6, r7
    ldr r9, [r1, r9, lsl #0x2]
    ldr sl, [r0, sl, lsl #0x2]
    mvn fp, r5
    orr fp, r7, fp
    eor fp, r6, fp
    add sl, fp, sl
    add sl, r9, sl
    add r9, r3, #0x2
    add sl, r4, sl
    mov r4, sl, lsl #0xa
    orr r4, r4, sl, lsr #0x16
    add r4, r7, r4
    ldr ip, [r1, r9, lsl #0x2]
    ldrb r9, [lr, r9]
    mvn sl, r6
    orr sl, r4, sl
    eor fp, r7, sl
    ldr sl, [r0, r9, lsl #0x2]
    add r9, r3, #0x3
    add sl, fp, sl
    add sl, ip, sl
    add sl, r5, sl
    mov r5, sl, lsl #0xf
    orr r5, r5, sl, lsr #0x11
    add r5, r4, r5
    ldr sl, [r1, r9, lsl #0x2]
    ldrb fp, [lr, r9]
    mvn r9, r7
    orr r9, r5, r9
    eor r9, r4, r9
    ldr fp, [r0, fp, lsl #0x2]
    add r8, r8, #0x4
    add r9, r9, fp
    add r9, sl, r9
    add r9, r6, r9
    mov r6, r9, lsl #0x15
    orr r6, r6, r9, lsr #0xb
    add r6, r5, r6
    add r3, r3, #0x4
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_31c
    ldr r0, [sp]
    ldr r0, [r0]
    add r1, r0, r7
    ldr r0, [sp]
    str r1, [r0]
    ldr r0, [r0, #0x4]
    add r1, r0, r6
    ldr r0, [sp]
    str r1, [r0, #0x4]
    ldr r0, [r0, #0x8]
    add r1, r0, r5
    ldr r0, [sp]
    str r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    add r1, r0, r4
    ldr r0, [sp]
    str r1, [r0, #0xc]
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_02101f34
_LIT1: .word data_02101fb4
