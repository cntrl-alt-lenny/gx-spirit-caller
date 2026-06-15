; func_02039690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b314
        .extern data_0219b330
        .extern data_0219c480
        .extern data_0219c494
        .extern func_02038c84
        .extern func_02038e58
        .extern func_02038fb0
        .extern func_0203a84c
        .extern func_0207d12c
        .extern func_02089008
        .extern func_020891fc
        .global func_02039690
        .arm
func_02039690:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    mov r6, r2
    ldrh r0, [r0, #0x4]
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT1
    mov r0, r1, lsl #0x10
    ldr r2, [r2]
    mov r1, r0, lsr #0x10
    mov r0, #0xc
    mla r0, r1, r0, r2
    tst r6, #0x400
    mov r7, #0x0
    beq .L_a4c
    mov r7, #0x2
    tst r6, #0x200
    movne r7, #0x1
.L_a4c:
    ldrh r0, [r0, #0x2]
    bl func_020891fc
    ldr r5, [r0]
    mov r0, r5
    bl func_0203a84c
    movs r4, r0
    beq .L_a78
    ldrb r0, [r4, #0x1c]
    add r0, r0, #0x1
    strb r0, [r4, #0x1c]
    b .L_b18
.L_a78:
    ldr r0, _LIT2
    mov r1, #0x60
    ldr r0, [r0]
    sub r2, r1, #0x80
    bl func_02038c84
    movs r4, r0
    addeq sp, sp, #0x8
    mov r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    str r5, [r4, #0x14]
    str r0, [r4, #0x8]
    mov r1, #0x1
    strb r1, [r4, #0x1c]
    str r0, [r4, #0x18]
    strb r7, [r4, #0x1f]
    mov r1, #0x4
    strb r1, [r4, #0x1e]
    mov r3, #0x40
    str r3, [r4, #0xc]
    mov r1, #0x2
    strb r1, [r4, #0x1d]
    tst r6, #0x8000
    beq .L_b0c
    str r0, [sp]
    mov r1, r5
    add r2, r4, #0x20
    str r0, [sp, #0x4]
    bl func_02038e58
    cmp r0, #0x40
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r2, #0x1
    mov r0, r5
    add r1, r4, #0x20
    strb r2, [r4, #0x1d]
    bl func_02089008
.L_b0c:
    ldr r0, _LIT3
    mov r1, r4
    bl func_0207d12c
.L_b18:
    mov r0, r4
    bl func_02038fb0
    ldr r0, _LIT0
    mov r1, #0x81
    strh r1, [r0]
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219c480
_LIT1: .word data_0219b314
_LIT2: .word data_0219b330
_LIT3: .word data_0219c494
