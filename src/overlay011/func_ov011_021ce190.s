; func_ov011_021ce190 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d403c
        .extern func_0208c8cc
        .extern func_ov000_021ace4c
        .extern func_ov000_021ad660
        .extern func_ov000_021ad8dc
        .extern func_ov000_021af338
        .extern func_ov000_021af358
        .extern func_ov011_021c9da0
        .extern func_ov011_021ca03c
        .extern func_ov011_021ca324
        .extern func_ov011_021ca524
        .extern func_ov011_021cada4
        .extern func_ov011_021cb3b4
        .extern func_ov011_021cc3d4
        .extern func_ov011_021cc9b4
        .extern func_ov011_021ccf8c
        .extern func_ov011_021cd048
        .extern func_ov011_021cd190
        .extern func_ov011_021cd65c
        .extern func_ov011_021cdb94
        .extern func_ov011_021cdc68
        .extern func_ov011_021ceebc
        .global func_ov011_021ce190
        .arm
func_ov011_021ce190:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    cmp r0, #0x0
    ldr r4, _LIT0
    beq .L_610
    cmp r0, #0x1
    bne .L_678
    ldr r0, [r4, #0x268]
    ldr r1, [r4, #0x280]
    bic r0, r0, #0x1e000
    str r0, [r4, #0x268]
    cmp r2, #0x0
    ldreq r0, [r4, #0x270]
    mov r3, #0x1
    bic r1, r1, #0xff
    biceq r0, r0, #0xff
    str r3, [r4, #0x264]
    str r1, [r4, #0x280]
    streq r0, [r4, #0x270]
    bl func_ov011_021ca524
    ldr r0, [r4, #0x264]
    bl func_ov011_021cb3b4
    bl func_ov011_021ca324
    bl func_ov011_021cc9b4
    bl func_ov011_021cdb94
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    bl func_ov011_021cd048
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    bl func_ov011_021cd190
    ldr r0, [r4, #0x280]
    mov r0, r0, lsl #0x9
    movs r0, r0, lsr #0x1f
    beq .L_5c8
    mov r0, #0x0
    bl func_ov000_021ace4c
    b .L_5d0
.L_5c8:
    mov r0, #0x1
    bl func_ov000_021ace4c
.L_5d0:
    ldr r0, _LIT1
    bl func_ov000_021af358
    mov r0, #0xc
    bl func_ov000_021af338
    bl func_ov011_021c9da0
    cmp r5, #0x0
    bne .L_5f0
    bl func_ov011_021ceebc
.L_5f0:
    bl func_ov011_021ccf8c
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0208c8cc
    mov r0, #0x1
    bl func_ov011_021cada4
    b .L_678
.L_610:
    ldr r0, [r4, #0x280]
    mov r1, #0x0
    bic r0, r0, #0xff
    str r1, [r4, #0x264]
    str r0, [r4, #0x280]
    bl func_ov011_021ca524
    ldr r0, [r4, #0x264]
    bl func_ov011_021cb3b4
    bl func_ov011_021ca324
    bl func_ov011_021cc9b4
    cmp r5, #0x0
    bne .L_644
    bl func_ov011_021ceebc
.L_644:
    bl func_ov011_021ccf8c
    bl func_ov011_021cdb94
    mov r0, #0x1
    mov r1, #0x3
    mov r2, #0x0
    bl func_0208c8cc
    mov r0, #0x0
    bl func_ov000_021ace4c
    ldr r0, _LIT2
    bl func_ov000_021af358
    mov r0, #0x5
    bl func_ov000_021af338
    bl func_ov011_021c9da0
.L_678:
    bl func_ov011_021cd65c
    bl func_ov011_021cdc68
    ldr r1, [r4, #0x268]
    ldr r0, [r4, #0x260]
    bic r1, r1, #0xf
    bic r0, r0, #0x100000
    str r1, [r4, #0x268]
    str r0, [r4, #0x260]
    bl func_ov011_021cc3d4
    bl func_ov011_021ca03c
    mov r0, #0x0
    str r0, [r4, #0x23c]
    str r0, [r4, #0x238]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word func_ov000_021ad660
_LIT2: .word func_ov000_021ad8dc
