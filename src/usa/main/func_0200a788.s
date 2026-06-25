; func_0200a788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_020c3f48
        .extern data_02104e6c
        .extern data_0210585c
        .extern data_02106714
        .extern func_02006bf0
        .extern func_02006e00
        .global func_0200a788
        .arm
func_0200a788:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x4]
    mov r1, #0x4
    mov r2, #0x0
    ldr r4, _LIT1
    bl func_02006bf0
    mov r5, r0
    ldr r0, _LIT2
    mov r1, r6
    mov r2, #0x8
    bl Copy32
    ldr r0, [r5, #0x4]
    add r1, r5, #0x28
    cmp r0, #0x1
    mov r0, #0x1
    bcc .L_f0
    ldr r3, _LIT3
    mov r9, #0x0
    mov r7, r0
.L_54:
    ldr r8, [r1, #0x10]
    ldr sl, [r1, #0xc]
    mov r2, r8, lsl #0x10
    mov ip, r2, lsr #0x10
    mov r2, r8, asr #0x10
    mov r8, r2, lsl #0x10
    mov r2, r9
    cmp sl, #0x0
    mov sl, r8, lsr #0x10
    mov r8, ip, asr #0x5
    and lr, ip, #0x1f
    bne .L_dc
    add ip, r4, r8, lsl #0x2
    add ip, ip, #0x1000
    ldr ip, [ip, #0x8a8]
    tst ip, r7, lsl lr
    addne r1, r1, #0x1c
    bne .L_e0
    ldr ip, [r6, r8, lsl #0x2]
    tst ip, r7, lsl lr
    addne r1, r1, #0x1c
    bne .L_e0
    cmp sl, #0x0
    bne .L_bc
    mov r2, r7
    b .L_cc
.L_bc:
    ldrh ip, [r3, #0x62]
    add sl, sl, #0x1
    cmp ip, sl
    movge r2, r7
.L_cc:
    cmp r2, #0x1
    ldreq r2, [r6, r8, lsl #0x2]
    orreq r2, r2, r7, lsl lr
    streq r2, [r6, r8, lsl #0x2]
.L_dc:
    add r1, r1, #0x1c
.L_e0:
    ldr r2, [r5, #0x4]
    add r0, r0, #0x1
    cmp r0, r2
    bls .L_54
.L_f0:
    mov r0, r5
    bl func_02006e00
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_020c3f48
_LIT1: .word data_02104e6c
_LIT2: .word data_02106714
_LIT3: .word data_0210585c
