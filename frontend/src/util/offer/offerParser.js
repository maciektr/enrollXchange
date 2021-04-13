import {parseDay} from "./weekDays";

const parseOffers = (queryResult) => {
    const parseNode = (node) => {
        node = node['node'];
        node['title'] = node['enrollment']['classTime']['course']['code'];
        node['lecturer'] = node['enrollment']['classTime']['lecturer']['fullName'];
        node['day'] = parseDay(node['enrollment']['classTime']['day']);
        node['time'] = node['enrollment']['classTime']['start'].substr(0,5);
        return node;
    };
    return queryResult['offers']['edges'].map(parseNode);
};

export default parseOffers;
