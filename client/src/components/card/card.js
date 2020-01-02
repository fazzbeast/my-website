import React from 'react';
import './card.scss';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faGithub } from '@fortawesome/free-brands-svg-icons';

const Card = ({ website, title, github, description, learnmore, company_image }) => {
	let optionalButtonLive = (
		<a className="live" href={website}>
			See it Live
		</a>
	);
	let optionalButtonGithub = (
		<a href={github}>
			View on <FontAwesomeIcon icon={faGithub} size="1x" />
		</a>
	);
	let optionalButtonMore = (
		<button className="learn-more" href={website}>
			Learn More
		</button>
	);
	let optionalButtonMore = <button className="learn-more">Learn More</button>;

	let titleImage = <img src={company_image} alt="" />;

	return (
		<div className="CardBody">
			<div className="info">
				{company_image ? titleImage : null}
				<h2>{title}</h2>
				<p>{description}</p>
				<div className="button-container">
					{website ? optionalButtonLive : null}
					{github ? optionalButtonGithub : null}
					{/* {learnmore ? optionalButtonMore : null} */}
				</div>
			</div>
		</div>
	);
};

Card.defaultProps = {
	title: 'Oops No Title Found',
	description: 'Information Goes Here',
	github: '/',
	website: '/',
	image: '/',
	learnmore: '/'
};
export default Card;
