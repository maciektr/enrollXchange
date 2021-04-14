import {parseDay} from "./weekDays";

const parseOffer = (node) => {
    node = node['node'];
    return {
        id: node['id'],
        title: node['enrollment']['classTime']['course']['code'],
        fullName: node['enrollment']['classTime']['course']['fullName'],
        lecturer: node['enrollment']['classTime']['lecturer']['fullName'],
        day: parseDay(node['enrollment']['classTime']['day']),
        time: node['enrollment']['classTime']['start'].substr(0,5),
        comment: node['comment'],
    }
};

const parseOffers = (queryResult) => {
    return queryResult['offers']['edges'].map(offer => parseOffer(offer));
};

const parseExchange = (node) => {
    node = node['node'];
    return {
        id: node.id,
        title: node.course.code,
        lecturer: node.lecturer.fullName,
        day: parseDay(node.day),
        time: node.start.substr(0,5),
    }
}

const parseMyOffers = (queryResult) => {
    const parseNode = (node) => {
        node = node['node'];
        return {
            id: node['id'],
            title: node['enrollment']['classTime']['course']['code'],
            lecturer: node['enrollment']['classTime']['lecturer']['fullName'],
            day: parseDay(node['enrollment']['classTime']['day']),
            time: node['enrollment']['classTime']['start'].substr(0,5),
            exchangeTo: node['exchangeTo']['edges'].map(exchange => parseExchange(exchange))
        }
    }
    return queryResult['offers']['edges'].map(myOffer => parseNode(myOffer));
}

export {parseOffers, parseMyOffers};
