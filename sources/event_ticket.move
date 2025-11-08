module eventticket::event_ticket {
    use sui::event;
    use std::ascii;

    public struct TicketEvent has copy, drop {
        event_name:ascii::String,
        seat_number:u64,
        owner:address,
    }

    public struct TicketTransferEvent has copy, drop {
        event_name:ascii::String,
        seat_number:u64,
        from:address,
        to:address,
    }

    public fun emit_ticket_event(
        event_name: ascii::String,
        seat_number:u64,
        owner:address
    ) {
        event::emit(TicketEvent {
            event_name,
            seat_number,
            owner,
        });
    }

    public fun emit_ticket_transfer_event(
        event_name: ascii::String,
        seat_number:u64,
        from:address,
        to:address,
        _ctx: &mut sui::tx_context::TxContext
    ){
        let transfer_event = TicketTransferEvent {
            event_name,
            seat_number,
            from,
            to,
        };
        event::emit(transfer_event);
    }
}