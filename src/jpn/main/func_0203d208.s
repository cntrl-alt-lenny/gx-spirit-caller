; func_0203d208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203d298
        .extern func_020aaf60
        .global func_0203d208
        .arm
func_0203d208:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldrh r3, [r6, #0xa]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x20
    bne .L_1a8
    bl func_0203d298
    cmp r0, #0x0
    addgt sp, sp, #0x4
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1a8:
    cmp r5, #0x0
    mov r9, #0x0
    ble .L_1fc
    ldrh r8, [r6, #0xa]
    add r6, r6, #0xc
    and r7, r8, #0xff
.L_1c0:
    ldrb r0, [r4, #0x3]
    cmp r7, r0
    bne .L_1ec
    mov r0, r6
    mov r2, r8
    add r1, r4, #0x4
    bl func_020aaf60
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldreqb r0, [r4, #0x1]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1ec:
    add r9, r9, #0x1
    cmp r9, r5
    add r4, r4, #0x24
    blt .L_1c0
.L_1fc:
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
