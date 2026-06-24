; func_0203d170 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203d298
        .extern func_020aaf60
        .global func_0203d170
        .arm
func_0203d170:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    ldrh r2, [r4, #0xa]
    mov sl, r1
    cmp r2, #0x20
    bne .L_104
    bl func_0203d298
    cmp r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_104:
    ldrb r5, [sl, #0xd12]
    mov r9, #0x0
    cmp r5, #0x0
    ble .L_16c
    ldr r0, _LIT0
    ldrh r6, [r4, #0xa]
    mov r8, sl
    add r7, sl, r0
    add r4, r4, #0xc
.L_128:
    add r0, r8, #0x400
    ldrh r0, [r0, #0x7a]
    cmp r6, r0
    bne .L_158
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_020aaf60
    cmp r0, #0x0
    addeq r0, sl, r9, lsl #0x2
    ldreqb r0, [r0, #0x445]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_158:
    add r9, r9, #0x1
    cmp r9, r5
    add r8, r8, #0xc0
    add r7, r7, #0xc0
    blt .L_128
.L_16c:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0000047c
