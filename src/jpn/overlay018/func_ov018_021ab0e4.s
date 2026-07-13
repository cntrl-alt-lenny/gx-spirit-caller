; func_ov018_021ab0e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02103fcc
        .extern data_02104e3c
        .extern data_02104e6c
        .extern data_ov018_021ad780
        .extern data_ov018_021ad790
        .extern data_ov018_021ad7a4
        .extern data_ov018_021ad7c8
        .extern data_ov018_021adbf4
        .extern data_ov018_021ae010
        .extern data_ov018_021ae0b0
        .extern func_02001a14
        .extern func_020057e4
        .extern func_02005910
        .extern func_02005be0
        .extern func_0200857c
        .extern func_0202ada4
        .extern func_0207ddc8
        .extern func_0207e7d0
        .extern func_0207f050
        .extern func_0207f338
        .extern func_0207f774
        .extern func_0207f79c
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d6c4
        .extern func_0208d944
        .extern func_02094410
        .extern func_ov018_021aa3c0
        .global func_ov018_021ab0e4
        .arm
func_ov018_021ab0e4:
    stmdb sp!, {r4, lr}
    mov r1, #0x4000000
    ldr r0, [r1]
    ldr r4, _LIT0
    bic r0, r0, #0x1f00
    str r0, [r1]
    add r3, r1, #0x1000
    ldr r0, [r3]
    ldr r2, _LIT1
    bic ip, r0, #0x1f00
    mov r1, r4
    mov r0, #0x0
    str ip, [r3]
    bl Fill32
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207ddc8
    bl func_02005910
    ldr r0, _LIT4
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    ldr r0, _LIT5
    bl func_0207e7d0
    ldr r0, _LIT6
    bl func_0202ada4
    ldr r0, _LIT7
    ldr r1, _LIT8
    ldr r2, [r0, #0x4]
    mov r0, #0xc
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    str r2, [r1, #0x930]
    bl func_02001a14
    ldr r0, _LIT9
    bl func_0207f79c
    ldr r0, _LIT10
    bl func_0207f774
    ldr ip, _LIT11
    mov r0, #0x200
    ldrh r3, [ip]
    mov r1, #0x7000000
    mov r2, #0x400
    orr r3, r3, #0x8000
    strh r3, [ip]
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x1
    bl func_0208d944
    mov r2, #0x4000000
    ldr r1, [r2]
    mov r0, #0x60
    bic r1, r1, #0x7000000
    str r1, [r2]
    ldr r1, [r2]
    bic r1, r1, #0x38000000
    str r1, [r2]
    bl func_0208d6c4
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c7e4
    ldr r3, _LIT12
    ldr r0, _LIT13
    ldrh r2, [r3]
    add ip, r0, #0x208
    ldr r1, _LIT14
    and r0, r2, #0x43
    orr r0, r0, #0x1c80
    orr r0, r0, #0x4000
    strh r0, [r3]
    ldrh lr, [r3, #0x2]
    mov r0, #0x200
    mov r2, #0x400
    and lr, lr, #0x43
    orr ip, lr, ip
    strh ip, [r3, #0x2]
    ldrh ip, [r3, #0x6]
    and ip, ip, #0x43
    orr ip, ip, #0xb90
    orr ip, ip, #0x1000
    strh ip, [r3, #0x6]
    bl func_02094410
    ldr r1, _LIT15
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    ldr r3, _LIT16
    ldr r0, _LIT17
    ldrh r2, [r3]
    sub r1, r0, #0x3e80
    mov r0, #0x2
    and r2, r2, #0x43
    orr r2, r2, #0xc90
    orr r2, r2, #0x7000
    strh r2, [r3]
    ldrh r2, [r3, #0x2]
    and r2, r2, #0x43
    orr r1, r2, r1
    strh r1, [r3, #0x2]
    ldrh r1, [r3, #0x6]
    and r1, r1, #0x43
    orr r1, r1, #0x1f80
    strh r1, [r3, #0x6]
    bl func_02005be0
    ldr r2, _LIT18
    ldr r0, _LIT19
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f338
    ldr r0, _LIT20
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f050
    bl func_0200857c
    cmp r0, #0x0
    add r0, r4, #0x900
    ldrh r2, [r0, #0xb4]
    bne .L_238
    mov r1, #0x1
    str r1, [r4, #0x4]
    bic r1, r2, #0x1
    orr r1, r1, #0x1
    b .L_244
.L_238:
    mov r1, #0x0
    str r1, [r4, #0x4]
    bic r1, r2, #0x1
.L_244:
    strh r1, [r0, #0xb4]
    ldr r1, _LIT21
    mov r2, #0x0
    ldr r0, _LIT22
    str r2, [r1, #0x3c]
    bl func_020057e4
    mov r0, #0x0
    str r0, [r4]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov018_021ad7c8
_LIT1: .word 0x000009b8
_LIT2: .word data_02104e3c
_LIT3: .word data_ov018_021ad780
_LIT4: .word 0x000001ff
_LIT5: .word data_ov018_021ae010
_LIT6: .word data_ov018_021ae0b0
_LIT7: .word data_02104e6c
_LIT8: .word data_ov018_021ad780
_LIT9: .word data_ov018_021ad7a4
_LIT10: .word data_ov018_021ad790
_LIT11: .word 0x04000304
_LIT12: .word 0x04000008
_LIT13: .word 0x00005c80
_LIT14: .word 0x07000400
_LIT15: .word 0x05000400
_LIT16: .word 0x04001008
_LIT17: .word 0x00007c90
_LIT18: .word 0x04001000
_LIT19: .word 0xffcfffef
_LIT20: .word data_ov018_021adbf4
_LIT21: .word data_02103fcc
_LIT22: .word func_ov018_021aa3c0
