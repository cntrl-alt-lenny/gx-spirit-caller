; func_ov022_021aa678 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104e3c
        .extern data_02104e6c
        .extern data_ov022_021ab804
        .extern data_ov022_021ab81e
        .extern data_ov022_021ab9c0
        .extern data_ov022_021ab9d0
        .extern data_ov022_021ab9e4
        .extern data_ov022_021aba08
        .extern data_ov022_021aba18
        .extern data_ov022_021abe34
        .extern data_ov022_021ac250
        .extern func_02001a14
        .extern func_020057e4
        .extern func_02005910
        .extern func_02005be0
        .extern func_0207ddc8
        .extern func_0207e7d0
        .extern func_0207f050
        .extern func_0207f338
        .extern func_0207f774
        .extern func_0207f79c
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208cf48
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_02094410
        .extern func_020b377c
        .extern func_ov022_021aa3c0
        .global func_ov022_021aa678
        .arm
func_ov022_021aa678:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r1, #0x4000000
    ldr r0, [r1]
    ldr r4, _LIT0
    bic r0, r0, #0x1f00
    str r0, [r1]
    add r3, r1, #0x1000
    ldr r0, [r3]
    ldr r2, _LIT1
    bic r5, r0, #0x1f00
    mov r1, r4
    mov r0, #0x0
    str r5, [r3]
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
    mov r0, #0xc
    bl func_02001a14
    ldr r0, _LIT6
    bl func_0207f79c
    ldr r0, _LIT7
    bl func_0207f774
    ldr r5, _LIT8
    mov r0, #0x200
    ldrh r3, [r5]
    mov r1, #0x7000000
    mov r2, #0x400
    orr r3, r3, #0x8000
    strh r3, [r5]
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x1
    bl func_0208d944
    mov r2, #0x4000000
    ldr r1, [r2]
    mov r0, #0x2
    bic r1, r1, #0x7000000
    str r1, [r2]
    ldr r1, [r2]
    bic r1, r1, #0x38000000
    str r1, [r2]
    bl func_0208d7d8
    mov r0, #0x60
    bl func_0208d6c4
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c7e4
    sub r5, r5, #0x2fc
    ldrh r2, [r5]
    mov r3, #0x4000000
    ldr r1, _LIT9
    and r2, r2, #0x43
    orr r2, r2, #0x3e80
    strh r2, [r5]
    ldr r2, [r3]
    mov r0, #0x1
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    bl func_02005be0
    bl func_0207f338
    mov r1, #0x0
    ldr r0, _LIT10
    mov r3, r1
    mov r2, #0x80
    bl func_0207f050
    ldr r1, _LIT11
    mov r0, #0x200
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT12
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x80
    bl func_0208cf48
    ldr r2, _LIT13
    mov r0, #0x2
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x3e80
    strh r1, [r2]
    ldrh r1, [r2, #0x2]
    and r1, r1, #0x43
    orr r1, r1, #0xf90
    orr r1, r1, #0x3000
    strh r1, [r2, #0x2]
    bl func_02005be0
    ldr r2, _LIT14
    ldr r0, _LIT9
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f338
    ldr r0, _LIT15
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f050
    ldr r0, _LIT16
    bl func_020057e4
    ldr r2, _LIT17
    mov r1, #0x1c
    ldr r3, [r2, #0x4]
    ldr r2, _LIT18
    mov r3, r3, lsl #0x1d
    mov r3, r3, lsr #0x1d
    mul r1, r3, r1
    ldrsh r1, [r2, r1]
    mov r0, #0x28000
    bl func_020b377c
    ldr r1, _LIT17
    mov ip, #0x0
    ldr r5, [r1, #0x4]
    ldr r2, _LIT19
    mov r5, r5, lsl #0x1d
    mov r1, #0x1c
    mov r5, r5, lsr #0x1d
    mla r2, r5, r1, r2
    mov r3, ip
    mov r7, #0x1e000
    mov r1, ip
    mvn r5, #0x0
.L_31c:
    mov r6, ip, lsl #0x1
    ldrsh r6, [r6, r2]
    cmp r6, r5
    add r6, r4, ip, lsl #0x2
    addeq lr, r6, #0x1000
    streq r1, [lr, #0xb8]
    addne lr, r6, #0x1000
    strne r7, [lr, #0xb8]
    add lr, r4, ip, lsl #0x2
    add r6, r3, #0x8c000
    add lr, lr, #0x1000
    add ip, ip, #0x1
    str r6, [lr, #0xec]
    cmp ip, #0xd
    add r3, r3, r0
    blt .L_31c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov022_021aba08
_LIT1: .word 0x00001154
_LIT2: .word data_02104e3c
_LIT3: .word data_ov022_021ab9c0
_LIT4: .word 0x000001ff
_LIT5: .word data_ov022_021ac250
_LIT6: .word data_ov022_021ab9e4
_LIT7: .word data_ov022_021ab9d0
_LIT8: .word 0x04000304
_LIT9: .word 0xffcfffef
_LIT10: .word data_ov022_021aba18
_LIT11: .word 0x07000400
_LIT12: .word 0x05000400
_LIT13: .word 0x04001008
_LIT14: .word 0x04001000
_LIT15: .word data_ov022_021abe34
_LIT16: .word func_ov022_021aa3c0
_LIT17: .word data_02104e6c
_LIT18: .word data_ov022_021ab81e
_LIT19: .word data_ov022_021ab804
