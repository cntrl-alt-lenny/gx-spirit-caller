; func_ov002_021bff00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bf294
        .global func_ov002_021bff00
        .arm
func_ov002_021bff00:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    mov r6, #0x0
    mov r8, r1
    mov r5, r6
    rsb r7, r9, #0x1
    mov r4, #0x1
.L_280c:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r5
    str r4, [sp]
    bl func_ov002_021bf294
    cmp r0, #0x0
    add r5, r5, #0x1
    addne r6, r6, #0x1
    cmp r5, #0x4
    ble .L_280c
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
