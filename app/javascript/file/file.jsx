// can include ts easily!!
import { add } from "./dep";

// then the webpack rules take care of the script typing and special transpilation.
import React from "react";
import {createRoot} from 'react-dom/client';

const SubPage = ({name}) => {
    return <div>hello {name}</div>;
}
// Define your React component
const Page2 = ({children}) => {
    return (
        <div>
            Hello from React!

            {add(1, 2)}

            {children}
        </div>
    );
};

createRoot(document.getElementById('root')).render(
    <>
        <Page2>
            <SubPage name="john"/>
        </Page2>
    </>
);

console.log("loading the file.jsx bundle");
