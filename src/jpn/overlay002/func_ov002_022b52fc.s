; func_ov002_022b52fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1a9c
        .extern func_0202d9a4
        .extern func_0208e7a8
        .extern func_0208ebf0
        .extern func_ov002_022a1674
        .extern func_ov002_022b848c
        .global func_ov002_022b52fc
        .arm
func_ov002_022b52fc:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    mov r4, r0
    bl func_0202d9a4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r3, r4, pc}
    ldr r0, _LIT0
    bl func_ov002_022a1674
    cmp r0, #0x0
    bne .L_40
    ldr r0, _LIT1
    bl func_ov002_022b848c
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r3, r4, pc}
.L_40:
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
    ldr r0, _LIT2
    mov r1, #0x0
    ldr r2, _LIT3
    str r1, [r0]
    mov r3, #0x32000
    str r3, [r0, #0x2c]
    mov r3, #0x5c000
    str r3, [r0, #0x2c]
    mov r3, #0x100
    str r3, [r0, #0x2c]
    mov r3, #0x80000
    str r3, [r0, #0x28]
    str r3, [r0, #0x28]
    mov r3, #0x800
    mov ip, #0x1000
    str ip, [r0, #0x28]
    sub lr, r0, #0x4
    mov ip, #0x3
    str ip, [lr]
    str r1, [r0, #0x10]
    mov ip, #0x2
    str ip, [lr]
    str r2, [r0, #0x7c]
    mov r2, r2, lsr #0x10
    str r2, [r0, #0x80]
    ldr lr, [r4, #0x4]
    ldr r2, _LIT4
    ldr ip, _LIT5
    orr r2, r2, lr, lsr #0x3
    str r2, [r0, #0x64]
    ldr r2, [r4, #0x8]
    mov r4, #0x1
    mov r2, r2, lsr #0x4
    str r2, [r0, #0x68]
    str ip, [r0, #0x60]
    str r4, [r0, #0xbc]
    ldr r2, _LIT6
    str r1, [r0, #0x44]
    str r2, [r0, #0x48]
    str r1, [r0, #0x48]
    str r3, [r0, #0x44]
    sub r2, r3, #0x8000000
    str r2, [r0, #0x48]
    str r1, [r0, #0x48]
    sub r2, r3, #-134217728
    str r2, [r0, #0x44]
    str r2, [r0, #0x48]
    str r1, [r0, #0x48]
    mov r2, #0x8000000
    str r2, [r0, #0x44]
    add r2, r2, #0xf800
    str r2, [r0, #0x48]
    str r1, [r0, #0x48]
    str r1, [r0, #0xc0]
    str r4, [r0, #0x4]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022d10dc
_LIT1: .word data_ov002_022d1a9c
_LIT2: .word 0x04000444
_LIT3: .word 0x4210ffff
_LIT4: .word 0x56400000
_LIT5: .word 0x001f00c0
_LIT6: .word 0xf800f800
