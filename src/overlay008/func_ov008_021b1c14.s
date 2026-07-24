; func_ov008_021b1c14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov008_021b270c
        .extern data_ov008_021b2710
        .extern data_ov008_021b2714
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02005088
        .extern func_020054a4
        .extern func_0202c0c0
        .extern func_0208de94
        .extern func_0208e120
        .extern OS_SPrintf
        .extern func_02094504
        .extern func_020aaf10
        .global func_ov008_021b1c14
        .arm
func_ov008_021b1c14:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    bl func_0208de94
    add r4, r0, #0xa20
    add r1, r4, #0x1000
    mov r0, #0x0
    mov r2, #0x880
    bl func_02094504
    mov r0, #0x1c8
    bl func_0202c0c0
    ldr r2, _LIT0
    mov r1, r0
    ldr r2, [r2]
    add r0, sp, #0x8
    ldr r2, [r2, #0x14]
    bl OS_SPrintf
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x14]
    cmp r0, #0x64
    blt .L_18d0
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r1, _LIT2
    add r0, sp, #0x8
    ldrne r1, _LIT3
    bl func_020aaf10
.L_18d0:
    add r0, sp, #0x8
    mov r1, #0xc
    bl func_020054a4
    rsbs r5, r0, #0xf8
    ldr r0, _LIT4
    mov r1, #0x20
    mov r2, #0x2
    movmi r5, #0x0
    bl func_02001d0c
    mov r2, #0x2
    str r2, [sp]
    mov ip, #0xc
    ldr r0, _LIT4
    add r1, sp, #0x8
    mov r3, r5
    add r2, r4, #0x1000
    str ip, [sp, #0x4]
    bl func_02005088
    bl func_0208e120
    mov r1, r0
    ldr r0, _LIT4
    add r1, r1, #0x580
    mov r2, #0xd1
    mov r3, #0x1
    bl func_02001e94
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov008_021b270c
_LIT1: .word data_02104f4c
_LIT2: .word data_ov008_021b2710
_LIT3: .word data_ov008_021b2714
_LIT4: .word data_02102c90
