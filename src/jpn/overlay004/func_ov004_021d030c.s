; func_ov004_021d030c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202d9a4
        .extern func_0208e7a8
        .extern func_0208ebf0
        .global func_ov004_021d030c
        .arm
func_ov004_021d030c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    mov r4, r0
    bl func_0202d9a4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r3, r4, pc}
    bl func_0208e7a8
    mov r1, #0x400000
    rsb r1, r1, #0x0
    mov r0, #0x0
    str r1, [sp]
    mov r1, #0x400000
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    mov r2, r0
    mov r1, #0xc0000
    mov r3, #0x100000
    str r0, [sp, #0x10]
    bl func_0208ebf0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r3, _LIT1
    str r1, [r0]
    mov r2, #0x33000
    str r2, [r0, #0x2c]
    mov r2, #0x60000
    mov ip, #0x800
    str r2, [r0, #0x2c]
    mov lr, #0x1000
    str lr, [r0, #0x2c]
    mov r2, r4, lsl #0x7
    str r2, [r0, #0x28]
    mov r2, #0x80000
    str r2, [r0, #0x28]
    mov r2, #0x8000000
    str lr, [r0, #0x28]
    sub lr, r0, #0x4
    mov r4, #0x3
    str r4, [lr]
    str r1, [r0, #0x10]
    mov r4, #0x2
    str r4, [lr]
    str r3, [r0, #0x7c]
    mov r4, r3, lsr #0x10
    ldr r3, _LIT2
    str r4, [r0, #0x80]
    str r3, [r0, #0x64]
    mov r4, #0x100
    ldr r3, _LIT3
    str r4, [r0, #0x68]
    str r3, [r0, #0x60]
    mov r4, #0x1
    str r4, [r0, #0xbc]
    ldr r3, _LIT4
    str r1, [r0, #0x44]
    str r3, [r0, #0x48]
    str r1, [r0, #0x48]
    str ip, [r0, #0x44]
    sub r3, ip, #0x8000000
    str r3, [r0, #0x48]
    str r1, [r0, #0x48]
    sub r3, ip, #-134217728
    str r3, [r0, #0x44]
    str r3, [r0, #0x48]
    str r1, [r0, #0x48]
    str r2, [r0, #0x44]
    add r2, r2, #0xf800
    str r2, [r0, #0x48]
    str r1, [r0, #0x48]
    str r1, [r0, #0xc0]
    str r4, [r0, #0x4]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
_LIT0: .word 0x04000444
_LIT1: .word 0x4210ffff
_LIT2: .word 0x56402000
_LIT3: .word 0x001f00c0
_LIT4: .word 0xf800f800
