const classes = [
    {
        title: 'Systemy rozproszone, K. Zieliński - W',
        start: '2021-03-01T08:00:00',
        end: '2021-03-01T09:30:00',
        color: 'green'
    },
    {
        title: 'WDIB, Ł. Faber - W',
        start: '2021-03-01T14:40:00',
        end: '2021-03-01T16:10:00',
        color: 'gray'
    },
    {
        title: 'Architektury, J. Kitowski - W',
        start: '2021-03-02T08:00:00',
        end: '2021-03-02T09:30:00',
        color: 'darkgreen'
    },
    {
        title: 'UX, B. Kwolek - W',
        start: '2021-03-03T08:00:00',
        end: '2021-03-03T09:30:00',
        color: 'blue'
    },
    {
        title: 'IO, J. Dajda - W',
        start: '2021-03-04T08:00:00',
        end: '2021-03-04T09:30:00',
        color: 'orange'
    },
    {
        title: 'WDIB, D. Suder - L',
        start: '2021-03-04T09:35:00',
        end: '2021-03-04T11:05:00',
        color: 'gray'
    },
    {
        title: 'Sieci, S. Zieliński - L',
        start: '2021-03-04T12:50:00',
        end: '2021-03-04T14:20:00',
        color: 'purple'
    },
    {
        title: 'Sieci, S. Zieliński - W',
        start: '2021-03-04T14:40:00',
        end: '2021-03-04T16:10:00',
        color: 'purple'
    },
    {
        title: 'IO, T. Pełech-Pilichowski - P',
        start: '2021-03-04T14:40:00',
        end: '2021-03-04T16:10:00',
        color: 'orange'
    },
    {
        title: 'WDIB, M. Król - P',
        start: '2021-03-04T16:15:00',
        end: '2021-03-04T17:45:00',
        color: 'gray'
    },
    {
        title: 'UX, J. Orzeł - L',
        start: '2021-03-05T08:00:00',
        end: '2021-03-05T09:30:00',
        color: 'blue'
    },
    {
        title: 'Systemy rozproszone, F. Malawski - L',
        start: '2021-03-05T12:50:00',
        end: '2021-03-05T14:20:00',
        color: 'green'
    },
    {
        title: 'Systemy wbudowane, A. Broza - L',
        start: '2021-03-05T14:40:00',
        end: '2021-03-05T16:10:00',
        color: 'darkred'
    },
];

const myOffers = [
    {
        id: 1,
        comment: "Dam czekolade",
        currentClass: {
            day: "Piątek",
            title: 'Systemy wbudowane, A. Broza - L',
            start: '2021-03-05T14:40:00',
            end: '2021-03-05T16:10:00',
        },
        exchange_to: [
            {
                title: 'Systemy wbudowane, A. Broza - L',
                start: '2021-03-05T12:50:00',
                end: '2021-03-05T14:20:00',
            }
        ]
    },
    {
        id: 2,
        comment: "",
        currentClass: {
            day: "Piątek",
            title: 'Systemy rozproszone, F. Malawski - L',
            start: '2021-03-05T12:50:00',
            end: '2021-03-05T14:20:00',
        },
        exchange_to: [
            {
                title: 'Systemy rozproszone, F. Malawski - L',
                start: '2021-03-04T12:50:00',
                end: '2021-03-04T14:20:00',
            },
            {
                title: 'Systemy rozproszone, Ł. Czekierda - L',
                start: '2021-03-04T08:00:00',
                end: '2021-03-04T09:30:00',
            }
        ]
    }

]

export {classes, myOffers};
