
import { Link } from "react-router-dom";

const Navbar = () => {
  return (
    <nav className="border-b h-[4vh]">
      <ul className="flex justify-center gap-4">
        <li className="hover:text-blue-500 cursor-pointer">
          <Link to="/">home</Link>
        </li>
      </ul>
    </nav>
  );
};

export default Navbar;

