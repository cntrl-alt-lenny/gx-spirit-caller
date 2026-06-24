; func_02023220 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_02104e3c
        .extern data_0219a7fc
        .extern func_02010f68
        .extern func_0207ddc8
        .extern func_0207e03c
        .extern func_0207e288
        .extern func_020851e4
        .extern func_0208c79c
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208e3e8
        .extern func_0208e504
        .extern func_0208e5c4
        .extern func_0208e6c4
        .extern func_0208e830
        .global func_02023220
        .arm
func_02023220:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r4, _LIT0
    mov r5, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r0, _LIT1
    str r5, [r0, #0x4]
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_64
    ldr r1, [r4, #0x4]
    mov r0, #0xd0
    mul r5, r1, r0
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r5
    mov r0, #0x0
    str r1, [r4]
    bl Fill32
.L_64:
    mov r0, #0x0
    mov r1, r0
    bl func_02010f68
    mov r0, #0x1
    mov r1, r0
    bl func_02010f68
    ldr r2, _LIT2
    ldr r0, _LIT3
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_020851e4
    ldr r1, _LIT4
    add r0, sp, #0x4
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207ddc8
    mov r0, #0x2
    mov r1, #0x1
    bl func_0207e03c
    mov r0, #0x8000
    mov r1, #0x1
    bl func_0207e288
    bl func_0208e830
    bl func_0208e6c4
    ldr r1, _LIT5
    mov r2, #0x2
    str r2, [r1]
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c7e4
    mov r0, #0x0
    bl func_0208c7c8
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r0, r2, #0x6c
    mov r1, #0x0
    bl func_0208c79c
    ldr ip, _LIT6
    ldr r0, _LIT7
    ldrh r2, [ip]
    ldr r1, _LIT8
    bic r2, r2, #0x3
    orr r2, r2, #0x2
    strh r2, [ip]
    ldrh r2, [ip, #0x58]
    and r0, r2, r0
    strh r0, [ip, #0x58]
    ldrh r0, [ip, #0x58]
    and r0, r0, r1
    strh r0, [ip, #0x58]
    ldrh r0, [ip, #0x58]
    bic r0, r0, #0x3000
    orr r0, r0, #0x8
    strh r0, [ip, #0x58]
    ldrh r0, [ip, #0x58]
    bic r0, r0, #0x3000
    orr r0, r0, #0x10
    strh r0, [ip, #0x58]
    ldrh r2, [ip, #0x58]
    mov r0, #0x0
    sub r1, r1, #0x1c
    and lr, r2, r1
    mov r1, r0
    mov r2, r0
    mov r3, r0
    strh lr, [ip, #0x58]
    bl func_0208e5c4
    mov r0, #0x0
    ldr r2, _LIT9
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp]
    bl func_0208e504
    mov r0, #0x0
    bl func_0208e3e8
    ldr r2, _LIT10
    ldr r1, _LIT11
    mov r0, #0x1
    str r2, [r1]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219a7fc
_LIT1: .word data_0219a7fc
_LIT2: .word 0x04001000
_LIT3: .word 0xffcfffef
_LIT4: .word data_02104e3c
_LIT5: .word 0x04000540
_LIT6: .word 0x04000008
_LIT7: .word 0xffffcffd
_LIT8: .word 0x0000cffb
_LIT9: .word 0x00007fff
_LIT10: .word 0xbfff0000
_LIT11: .word 0x04000580
