; func_02020fa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern func_02005688
        .extern func_02005f10
        .extern func_02006148
        .extern func_02020d30
        .extern func_020919a4
        .global func_02020fa4
        .global .L_02020fa4
        .global .L_02020fa8
        .global .L_02020fac
        .global .L_02020fb0
        .global .L_02020fb4
        .global .L_02020fb8
        .global .L_02020fbc
        .global .L_02020fc0
        .global .L_02020fc4
        .global .L_02020fc8
        .global .L_02020fcc
        .global .L_02020fd0
        .global .L_02020fd4
        .global .L_02020fd8
        .global .L_02020fdc
        .global .L_02020fe0
        .global .L_02020fe4
        .global .L_02020fe8
        .global .L_02020fec
        .global .L_02020ff0
        .global .L_02020ff4
        .global .L_02020ff8
        .global .L_02020ffc
        .global .L_02021000
        .global .L_02021004
        .global .L_02021008
        .arm
func_02020fa4:
.L_02020fa4:
    stmdb sp!, {r3, lr}
.L_02020fa8:
    mov r0, #0x1
.L_02020fac:
    bl func_02020d30
.L_c:
.L_02020fb0:
    b .L_c
.L_02020fb4:
    stmdb sp!, {r3, lr}
.L_02020fb8:
    mov r0, #0x4
.L_02020fbc:
    bl func_02020d30
.L_1c:
.L_02020fc0:
    b .L_1c
.L_02020fc4:
    stmdb sp!, {r3, r4, r5, lr}
.L_02020fc8:
    mov r0, #0x5
.L_02020fcc:
    bl func_02020d30
.L_02020fd0:
    ldr r4, _LIT0
.L_02020fd4:
    mov r5, #0x0
.L_34:
.L_02020fd8:
    bl func_02005688
.L_02020fdc:
    bl func_02005f10
.L_02020fe0:
    bl func_02006148
.L_02020fe4:
    cmp r0, #0x0
.L_02020fe8:
    bne .L_60
.L_02020fec:
    ldrh r0, [r4, #0x54]
.L_02020ff0:
    tst r0, #0x1
.L_02020ff4:
    bne .L_60
.L_02020ff8:
    mov r0, r5
.L_02020ffc:
    bl func_020919a4
.L_02021000:
    b .L_34
.L_60:
.L_02021004:
    mov r0, #0x1
.L_02021008:
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104acc
