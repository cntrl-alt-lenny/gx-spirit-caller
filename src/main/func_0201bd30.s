; func_0201bd30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_020190c0
        .extern func_020190ec
        .extern func_0201b7e0
        .global func_0201bd30
        .arm
func_0201bd30:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    ldreq r0, [r0, #0x918]
    cmpeq r0, #0x0
    bne .L_20c
    bl func_020139c4
    cmp r0, #0x0
    bne .L_20c
    bl func_020190ec
    cmp r0, #0x0
    beq .L_20c
    mov r0, r4
    bl func_0201b7e0
    cmp r0, #0x5
    beq .L_1c0
    mov r0, r4
    bl func_0201b7e0
    cmp r0, #0x4
    bne .L_20c
.L_1c0:
    bl func_020190c0
    cmp r0, #0x1
    mov r0, r4
    bne .L_1f0
    bl func_0201b7e0
    cmp r0, #0x4
    ldr r0, [r4, #0x10]
    orreq r0, r0, #0x20000
    streq r0, [r4, #0x10]
    orrne r0, r0, #0x10000
    strne r0, [r4, #0x10]
    b .L_20c
.L_1f0:
    bl func_0201b7e0
    cmp r0, #0x4
    ldr r0, [r4, #0x10]
    orreq r0, r0, #0x8000
    streq r0, [r4, #0x10]
    orrne r0, r0, #0x4000
    strne r0, [r4, #0x10]
.L_20c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
