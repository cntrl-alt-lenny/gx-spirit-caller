; func_ov022_021aa954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_02104e6c
        .extern data_ov022_021ab804
        .extern data_ov022_021ab8c0
        .extern data_ov022_021ab9c0
        .extern data_ov022_021ab9d0
        .extern data_ov022_021ab9e4
        .extern data_ov022_021aba08
        .extern data_ov022_021ac284
        .extern data_ov022_021ac288
        .extern data_ov022_021ac28c
        .extern data_ov022_021ac48c
        .extern data_ov022_021acb28
        .extern func_02006e00
        .extern func_0201ece8
        .extern func_0201ed20
        .extern func_0201ed58
        .extern func_0201ed90
        .extern func_0203737c
        .extern func_0207e550
        .extern func_0207f428
        .extern func_0207f528
        .extern func_0208c79c
        .extern func_ov022_021aa460
        .global func_ov022_021aa954
        .arm
func_ov022_021aa954:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r0, #0x0
    ldr r3, _LIT0
    mov r1, r0
    mov r2, #0x1
    ldr r8, _LIT1
    bl func_ov022_021aa460
    mov r0, #0x1
    ldr r3, _LIT2
    mov r2, r0
    mov r1, #0x5
    bl func_ov022_021aa460
    ldr r1, _LIT3
    add r0, sp, #0x4
    ldr r1, [r1, #0xc]
    bl func_0201ed58
    mov r4, r0
    ldr r0, [sp, #0x4]
    ldr r3, _LIT4
    mov r1, #0x0
    mov r2, #0x1
    bl func_0207f528
    mov r0, r4
    bl func_02006e00
    ldr r1, _LIT3
    add r0, sp, #0x0
    ldr r1, [r1, #0x10]
    bl func_0201ed90
    mov r4, r0
    ldr r0, [sp]
    ldr r3, _LIT5
    mov r1, #0x0
    mov r2, #0x1
    bl func_0207f428
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT6
    ldr r1, _LIT7
    mov r2, #0x20
    bl Copy32
    ldr r1, _LIT3
    ldr r0, _LIT8
    ldr r1, [r1, #0x14]
    bl func_0201ed20
    ldr r2, _LIT9
    ldr r1, _LIT3
    str r0, [r2, #0x8bc]
    ldr r1, [r1, #0x18]
    ldr r0, _LIT10
    bl func_0201ece8
    ldr r1, _LIT9
    ldr r7, _LIT11
    ldr r6, _LIT12
    mov r9, #0x0
    str r0, [r1, #0x8c0]
    mov r4, #0x1c
    mvn r5, #0x0
.L_49c:
    ldr r0, [r6, #0x4]
    mov r1, r9, lsl #0x1
    mov r0, r0, lsl #0x1d
    mov r2, r0, lsr #0x1d
    mla r0, r2, r4, r7
    ldrsh r0, [r1, r0]
    cmp r0, r5
    beq .L_4d8
    mov r1, r0, lsl #0x10
    ldr r0, [r8, #0x880]
    mov r1, r1, lsr #0x10
    bl func_0207e550
    add r1, r8, r9, lsl #0x2
    add r1, r1, #0x1000
    str r0, [r1, #0x84]
.L_4d8:
    add r9, r9, #0x1
    cmp r9, #0xd
    blt .L_49c
    ldr r2, _LIT9
    mov r3, #0x14000
    str r3, [r2, #0x50]
    ldr r0, _LIT13
    mvn r1, #0xf
    str r3, [r2, #0x54]
    bl func_0208c79c
    ldr r0, _LIT14
    mvn r1, #0xf
    bl func_0208c79c
    mov r2, #0x0
    sub r3, r2, #0x1
    mov r0, #0x2e
    mov r1, #0x1
    bl func_0203737c
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov022_021ac28c
_LIT1: .word data_ov022_021aba08
_LIT2: .word data_ov022_021ac48c
_LIT3: .word data_ov022_021ab8c0
_LIT4: .word data_ov022_021ab9e4
_LIT5: .word data_ov022_021ab9d0
_LIT6: .word 0x05000200
_LIT7: .word data_ov022_021acb28
_LIT8: .word data_ov022_021ac284
_LIT9: .word data_ov022_021ab9c0
_LIT10: .word data_ov022_021ac288
_LIT11: .word data_ov022_021ab804
_LIT12: .word data_02104e6c
_LIT13: .word 0x0400006c
_LIT14: .word 0x0400106c
