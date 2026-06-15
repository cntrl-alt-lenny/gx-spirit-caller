; func_020056a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .global func_020056a4
        .arm
func_020056a4:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldrh r3, [r2, #0x52]
    ldr ip, _LIT2
    ldr r0, _LIT3
    strh r3, [r2, #0x50]
    ldrh lr, [r1]
    ldrh r3, [ip]
    ldr r1, _LIT4
    orr r3, lr, r3
    eor r3, r3, r0
    and r0, r3, r0
    strh r0, [r2, #0x52]
    ldrh r0, [ip]
    add r3, r1, #0xb00
    ldrh ip, [r3, #0x50]
    and r0, r0, #0x8000
    movs r0, r0, asr #0xf
    addne r0, r1, #0xb00
    movne r2, #0x0
    strneh r2, [r0, #0x52]
    ldrh r0, [r3, #0x52]
    eor r2, r0, ip
    and r2, r0, r2
    strh r2, [r3, #0x54]
    ldrh r2, [r3, #0x54]
    cmp r0, ip
    strh r2, [r3, #0x56]
    strh r2, [r3, #0x58]
    beq .L_4f0
    mov r0, #0x0
    strh r0, [r3, #0x5a]
    strh r0, [r3, #0x5c]
    ldmia sp!, {r3, pc}
.L_4f0:
    ldrh ip, [r3, #0x5a]
    add r2, r1, #0x5a
    add lr, r2, #0xb00
    add r2, ip, #0x1
    strh r2, [r3, #0x5a]
    ldrh r2, [r3, #0x5a]
    cmp r2, #0x14
    bcc .L_528
    ldrh ip, [lr]
    ldrh r2, [r3, #0x56]
    sub ip, ip, #0x6
    orr r0, r2, r0
    strh ip, [lr]
    strh r0, [r3, #0x56]
.L_528:
    add r2, r1, #0xb00
    ldrh ip, [r2, #0x5c]
    add r0, r1, #0x35c
    ldrb r3, [r1, #0xb5e]
    add ip, ip, #0x1
    strh ip, [r2, #0x5c]
    ldrh ip, [r2, #0x5c]
    add lr, r0, #0x800
    cmp ip, r3
    ldmltia sp!, {r3, pc}
    ldrh ip, [lr]
    ldrb r3, [r1, #0xb5f]
    ldrh r1, [r2, #0x58]
    ldrh r0, [r2, #0x52]
    sub r3, ip, r3
    strh r3, [lr]
    orr r0, r1, r0
    strh r0, [r2, #0x58]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104bac
_LIT1: .word 0x04000130
_LIT2: .word 0x027fffa8
_LIT3: .word 0x00002fff
_LIT4: .word data_021040ac
